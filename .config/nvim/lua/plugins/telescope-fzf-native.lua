return {
    'nvim-telescope/telescope-fzf-native.nvim',
    lazy = true,
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
    config = function ()
        require('config.plugins.telescope-fzf-native')
    end
}
