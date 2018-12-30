const activate = (oni) => {
    oni.editors.activeEditor.neovim.command("imap jk <ESC>")
};

module.exports = {
    activate,
    "editor.fontSize": "14px",
    "editor.fontFamily": "Fira Code",
    "editor.completions.enabled": true
}
