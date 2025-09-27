-- Messy hack to force 'yml' files to be set as
-- Ansible filetype
vim.filetype.add({
	extension = {
		yml = "yaml.ansible",
	},
})
