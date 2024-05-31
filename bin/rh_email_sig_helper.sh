#!/usr/bin/env bash

output=$(cat <<EOF
<style> @import url(https://static.redhat.com/libs/redhat/redhat-font/latest/webfonts/red-hat-font.css); </style>
        <p class="fullname-container" style="font-weight:bold; margin:0; padding:0; font-size: 14px; margin-bottom:0; font-family:'RedHatText', sans-serif;">
          <span class="firstname-container">Chris</span> <span class="lastname-container">Mulder</span><span class="cert" style="color:#aaa; margin:0;"></span>
        </p>
        
        <p class="position-container" style="font-weight: normal; font-size: 12px; margin: 0px; font-family: RedHatText, sans-serif;">
          <span class="position">Senior Solution Architect</span>
        </p>
        <p class="legal-container" style="font-weight:normal; margin:0;margin-bottom:4px; font-size:12px; font-family:'RedHatText', sans-serif;">
          <a class="redhat-anchor" style="color:#0088ce;font-size:12px;margin:0;text-decoration:none;font-family:'RedHatText', sans-serif;" href="https://www.redhat.com" target="_blank">Red Hat <span></span></a>
        </p>
    <div style="margin-bottom:4px;">
      
      
    </div>
    <p class="contact-container" style="font-weight: normal; margin: 0px; font-size: 12px; font-family: RedHatText, sans-serif;">
      
      <span class="mobile-container" style=""><br>M: <a href="tel:+27820406434" style="color:#000;font-size:12px;margin:0;text-decoration:none;font-family:'RedHatText', sans-serif;">+27820406434</a>  &nbsp; &nbsp;</span>
      
    </p>
    

     <!-- https://static.redhat.com/libs/redhat/brand-assets/2/social/social-media--facebook--53x13.png

     https://static.redhat.com/libs/redhat/brand-assets/2/social/social-media--instagram--53x50.png

     https://static.redhat.com/libs/redhat/brand-assets/2/social/social-media--linkedin--53x46.png

     https://static.redhat.com/libs/redhat/brand-assets/2/social/social-media--twitter--53x53.png -->

    

    <div style="margin-top:12px;">
      <table border="0" cell-padding="0" cell-spacing="0">
        <tbody><tr>
          <td width="100px"><a href="https://www.redhat.com"> <img src="https://static.redhat.com/libs/redhat/brand-assets/2/corp/logo--200.png" width="90" height="auto"></a> </td>
          
        </tr>
      </tbody></table>
    </div>
EOF
)

echo ${output}
