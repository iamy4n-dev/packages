if status is-interactive
    # zoxide integration
    if command -q zoxide
        zoxide init fish | source
    end

    # starship prompt
    if command -q starship
        starship init fish | source
    end

    # atuin
    if command -q atuin
        atuin init fish | source
    end
end
