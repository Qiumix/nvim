# Qiumix's neovim configration

## showcase

比较极简的gruvbox主题配置，能透明的就透明。

<img width="2560" height="1600" alt="Image" src="https://github.com/user-attachments/assets/b9c6f10f-b950-4332-ac9f-7127eaf47ae6" />
<img width="2560" height="1600" alt="Image" src="https://github.com/user-attachments/assets/4f6873cd-f2d0-4669-9e96-2765e0d0896b" />
<img width="2560" height="1600" alt="Image" src="https://github.com/user-attachments/assets/808bc653-50b4-4df4-931e-e961cd3c49c6" />

## intro

个人自用neovim配置，架构追求简洁，没有特殊的自定义语言spec然后消费合并，没有自定义的复杂模块，也没有花里胡哨的dashboard。

功能上能用插件解决的需求就下载一个插件，尽量不手搓，除了[lastplace.nvim](https://github.com/nxhung2304/lastplace.nvim)这种一个autocmd就能实现的。

个人自用的rime中英自动切换配置也独立成了一个插件，而不是维护在配置里。

不过我并没有使用mason，管理二进制工具链这种事情我认为应该交给包管理器来着，因为主力系统是arch，所以几乎所有工具都可以包管理器下载，mason对我来说不是很必要。

windows上你可以用scoop来着，包不算多，不过还是比较好用，因为它能自动append PATH变量，解决windows软件二进制和资产放一起的问题，tree-sitter和neovim-nightly里面也可以下载。

按键我借鉴了一点点helix，gn/gp切buffer，gh/gl行首尾，ge go to end line of file，插入模式的补全也是blink.cmp的默认按键，gn/gp切补全项，gy接受，没有使用tab键。

## requirements

- 版本需求: neovim-nightly，也就是当前的0.13版本
- 工具
  - [tree-sitter](https://github.com/tree-sitter/tree-sitter): 你需要的是它的cli程序，在arch上是来自archlinuxcn的tree-sitter-git包(archlinuxcn的neovim-git包会依赖它的)，用于编译各个语言的ts的parser，被[tree-sitter-manager.nvim](https://github.com/romus204/tree-sitter-manager.nvim)依赖。另外编译时候可能还需要gcc/clang啊，zig啊，go啊，rust之类的编译器，具体的看parser是什么语言写的。
  - [ripgrep](https://github.com/BurntSushi/ripgrep) 用来查找内容，[snacks](https://github.com/folke/snacks.nvim) 和 [grug-far](https://github.com/MagicDuck/grug-far.nvim) 依赖
  - [fd](https://github.com/sharkdp/fd) 用来搜索文件，被 [snacks](https://github.com/folke/snacks.nvim)依赖
  - [yazi](https://github.com/sxyazi/yazi)，tui文件管理器，替代了常见的nvim配置中的左侧file tree，比较好用，tabs+buffers+yazi就可以满足多文件管理需求，而且yazi的按键风格也是vim的，可以愉快地hjkl。yazi还可以通过插件来把右侧文件夹的预览改成tree/eza -T之类的shell命令，也可以集成zoxide和fzf搜索文件(这是不需要装插件就有的功能)，甚至starship和ripgrep也是可以通过插件集成的，非常的unix哲学。
  - [kd](https://github.com/Karmenzind/kd/)，提供`<leader>k`的词典。

## installation

### unix (linux/mac/bsd/termux/etc..)

```bash
git clone https://github.com/Qiumix/nvim.git ~/.config/nvim
```

### windows

```powershell
git clone https://github.com/Qiumix/nvim.git "$env:LOCALAPPDATA\nvim"
```

然后进入nvim后按一下a来同意vim.pack下载插件就好啦

## hierarchy

```bash
├── after
│   └── lsp          # 里面存放了nvim自带的`vim.lsp.Config`的各个spec，用于自定义的lsp配置，放到after后来确保在`nvim-lspconfig/lsp`后加载
├── filetype.lua
├── init.lua         # 配置加载入口
└── lua
    ├── config       # 各个插件的配置，如果插件setup函数消费的opts比较复杂会在这里单独开一个文件require
    ├── core
    │   ├── autocmd.lua # 各种懒加载事件
    │   ├── emmylua_ls_bridge.lua # 让emmylua_ls获取nvim的各种spec，包括插件的，比lua_ls快超级多，因为是rust(
    │   ├── lsp.lua # 启用的lsp，来源是after/lsp和`nvim-lspconfig/lsp`下的不带扩展名的lua文件名
    │   ├── options.lua # neovim自带的各种配置可以`:h options查看`
    │   └── usercmd.lua # 自定义的用户级命令，没啥用
    ├── keymap       # 按键配置，合并后由whichkey消费
    └── plugins
        ├── code
        ├── completion
        ├── edit
        ├── file
        ├── init.lua # import plugins下的所有lua子模块，也就是各个插件分类
        ├── langs
        ├── mini
        ├── tool
        └── ui
```

## bench

配置7940hx，16G的三星laptop ddr5，sn560硬盘。

虽然平均启动速度很好看，但是日用基本还是看max，因为后续基本是从内存加载nvim插件和配置，只有刚开始会走硬盘。

```bash
vim-startuptime -vimpath nvim -warmup 3 -count 100 | head -20
Extra options: []
Measured: 100 times

Total Average: 16.741470 msec
Total Max:     43.090000 msec
Total Min:     14.879000 msec

  AVERAGE       MAX      MIN
-----------------------------
10.245670 27.165000 8.850000: /home/qiumix/.config/nvim/init.lua
 1.592130  4.085000 1.354000: nvim_exec2() called at /home/qiumix/.config/nvim/init.lua:0
 1.510250  3.869000 1.277000: /home/qiumix/.local/share/nvim/site/pack/core/opt/gruvbox.nvim/colors/gruvbox.lua
 1.285030  3.084000 1.092000: reading ShaDa
 1.133140  2.811000 0.911000: /home/qiumix/.config/nvim/filetype.lua
 0.813740  1.954000 0.613000: require('vim.filetype')
 0.700070  1.791000 0.623000: loading rtp plugins
 0.652270  1.545000 0.533000: require('vim._core.defaults')
 0.570920  1.339000 0.359000: require('vim.pack')
 0.557820  1.210000 0.398000: require('core.options')
 0.337730  0.937000 0.240000: require('gruvbox')
```

## thanks

[dashboard](./dashboard.txt)是[lingshin](https://github.com/lingshinx)送我的生日礼物，感谢lingshin sama。(虽然现在没有装dashboard插件呢)
