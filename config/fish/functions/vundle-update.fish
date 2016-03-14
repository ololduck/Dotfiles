function vundle-update
    vundle-init
    vim -c 'execute "PluginUpdate" | qa'
    echo "Done!"
end
