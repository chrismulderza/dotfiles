#!/usr/bin/env bash

CURRENT="`pwd`"
BASE_DIR=${HOME}/code/dotfiles
GIT_USER="chrismulderza"
DOTFILES_REPO="git@github.com:${GIT_USER}/dotfiles.git"
INSTALL_ZSH=true
CONFIG_ONLY=false
ANSIBLE_BINARY="/usr/local/bin/ansible"
ANSIBLE_MINIMUM_VERSION="1.6"

#set -e

info () {
    printf "\r\033[2K[ \033[00;34m..\033[0m ] $1\n"
}

success () {
    printf "\r\033[2K[ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
    printf "\r\033[2K[\033[0;31mFAIL\033[0m] $1\n"
    echo ''
    exit 1
}

link_files () {
    if [ -L "$2" ] ; then
        rm -f "$2"
    fi

    ln -s "$CURRENT/$1" "$2"
    success "linked $1 to $2"
}

ensure_dir () {
    if [ ! -d "$1" ] ; then
        mkdir -p "$1"

        success "created directory $1"
    fi
}

version() { 
  echo "$@" | awk -F. '{ printf("%d%03d%03d%03d\n", $1,$2,$3,$4); }'; 
}

test_env () {
    info "Variables"
    info "BASE_DIR=${BASE_DIR}"
    info "GIT_USER=${GIT_USER}"
    info "DOTFILES_REPO=${DOTFILES_REPO}"
    info "This is an information line"
    success "This is a success line"
    fail "This is a fail line"
}


installDevTools(){
    # Wholeheartedly lifted from
    #  https://github.com/timsutton/osx-vm-templates/blob/master/scripts/xcode-cli-tools.sh
    info "Installing XCode command line tools"
    if [ "$OSX_VERS" -ge 9 ]; then
        # create the placeholder file that's checked by the CLI updates .dist in Apple's SUS catalog
        /usr/bin/touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
        # find the product id with "Developer" in the name
        PRODID=$(/usr/sbin/softwareupdate -l | awk '/Developer/{print x};{x=$0}' | awk '{print $2}')
        # install it (amazingly, it won't find the update if we put the update ID in double-quotes)
        /usr/sbin/softwareupdate --install $PRODID --verbose > /dev/null 2>&1
    # on 10.7/10.8, we'd instead download from public download URLs, which can be found in
    # the dvtdownloadableindex:
    # https://devimages.apple.com.edgekey.net/downloads/xcode/simulators/index-3905972D-B609-49CE-8D06-51ADC78E07BC.dvtdownloadableindex
    else
        [ "$OSX_VERS" -eq 7 ] && DMGURL=http://devimages.apple.com/downloads/xcode/command_line_tools_for_xcode_os_x_lion_april_2013.dmg
        [ "$OSX_VERS" -eq 8 ] && DMGURL=http://devimages.apple.com/downloads/xcode/command_line_tools_for_osx_mountain_lion_april_2014.dmg
        TOOLSPATH="/tmp/clitools.dmg"
        /usr/bin/curl "$DMGURL" -o "$TOOLSPATH"
        TMPMOUNT=`/usr/bin/mktemp -d /tmp/clitools.XXXX`
        /usr/bin/hdiutil attach "$TOOLSPATH" -mountpoint "$TMPMOUNT"
        /usr/sbin/installer -pkg "$(find $TMPMOUNT -name '*.mpkg')" -target /
        /usr/bin/hdiutil detach "$TMPMOUNT"
        /bin/rm -rf "$TMPMOUNT"
        /bin/rm "$TOOLSPATH"
    fi
}

checkGetAdmin() {
  ## Check if user has admin rights
  info "Checking user..."
  declare -xi IN_ADMIN="$(/usr/bin/dscl /Search read /Groups/admin GroupMembership | /usr/bin/grep -c ${USER})"
  [ "$IN_ADMIN" != 1 ] && fail "This script requires admin access, you're logged in as ${USER}!" 
  success "User has admin access"

  info "Getting admin token"
  sudo -v

}

checkXCodeCLI() {
  # Check OS to provide correct method/URL for CLI Tools installation
  declare -x OSX_VERS=$(sw_vers -productVersion | awk -F "." '{print $2}')

  # Build array of most probable receipts from CLI tools for current & past OS versions, partially from
  # https://github.com/Homebrew/homebrew/blob/208f963cf2/Library/Homebrew/os/mac/xcode.rb#L147-L150
  declare -xa BUNDLE_IDS=('com.apple.pkg.DeveloperToolsCLI' \
      'com.apple.pkg.DeveloperToolsCLILeo' 'com.apple.pkg.CLTools_Executables' \
      'com.apple.pkg.XcodeMAS_iOSSDK_7_0')

  # Set flag for the presence of a CLI tools receipt
  declare -xi XCODE_CLI=0

  # Iterate over array, break out and skip install if we get a zero return code
  for id in ${BUNDLE_IDS[@]}; do
      /usr/sbin/pkgutil --pkg-info=$id > /dev/null 2>&1
      if [[ $? == 0 ]]; then
          success "Found "$id", Xcode Developer CLI Tools install not needed"
          ((XCODE_CLI++))
          break
      fi
  done

  if [[ $XCODE_CLI -ne 1 ]]; then
      info "XCode Tools Installation"
      info "------------------------"
      info ""
      info "Please wait while Xcode is installed"
      installDevTools
      if [[ $? -ne 0 ]]; then
          fail "Xcode installation failed"
      fi
      success "XCode Tools Installed"
  fi
}

checkHomebrew() {
  which -s brew
  if [[ $? != 0 ]] ; then
    info "Homebrew Installation"
    info "------------------------"
    # Install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /dev/null 2>&1
    if [[ $? != 0 ]] ; then
      fail "Could not install Homebrew"
    else
      success "Homebrew installation complete"
    fi
  else
    success "Found Homebrew"
    info "Updating Homebrew"
    brew update
    if [[ $? != 0 ]] ; then
      fail "Could not update Homebrew"
    else
      success "Homebrew updated"
    fi
fi

}

checkAnsible() {

  info "Checking Ansible..."
  if [ ! -f "${ANSIBLE_BINARY}" ]; then
    should_install_ansible=true
    info "Ansible not installed"
  else
    info "Ansible found, checking version..."
    ansible_installed_version=$(ansible --version 2>&1 | grep ansible | cut -d ' ' -f 2)
    info "Ansible version: ${ansible_installed_version}"
    if [ $(version ${ansible_installed_version}) -lt $(version ${ANSIBLE_MINIMUM_VERSION}) ]; then
      ansible_correct_version_installed=false
    else
      ansible_correct_version_installed=true
    fi

    if [ "${ansible_correct_version_installed}" ]; then
      should_install_ansible=false
      success "Ansible version >= ${ANSIBLE_MINIMUM_VERSION}"
    else
      should_install_ansible=true
      info "Ansible version < ${ANSIBLE_MINIMUM_VERSION}"
    fi
  fi

  if [ "${should_install_ansible}" == true ]; then
    info "Ansible Installation"
    info "------------------------"
    brew install ansible
    if [[ $? -ne 0 ]]; then
        fail "Ansible installation failed"
    fi
    success "Ansible Installation complete"
  fi
}


# Parse options
if [ $# -gt 0 ] ; then
    for arg in $@ ; do
        if [ $arg = '--no-zsh' ] ; then
            INSTALL_ZSH=false
        elif [ $arg = '--config-only' ] ; then
            CONFIG_ONLY=true
        elif [ $arg = '--test' ] ; then
            test_env
        fi
    done
fi

## Start Main 
info Starting...

## Main program flow

# Check if the user is an admin, and get admin token via sudo
checkGetAdmin

# Check/Install XCode Command Line Tools
checkXCodeCLI

# Check/Install Homebrew
checkHomebrew

# Check/Install Ansible
checkAnsible

# Clone MacDev Playbook


## TODO
## Print preample

success "Complete!"
