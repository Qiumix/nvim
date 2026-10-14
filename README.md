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

配置`7940HX`，16G的三星laptop DDR5，SN560硬盘，装了16G傲腾当swap。
cpu运行频率4.9Ghz，我日常会开静音模式，大概2.0Ghz左右，冷启动会跑到38ms左右。
这取决于cpu频率，我这里大部分情况硬盘io不是瓶颈，第一次启动后就有luac缓存了。
这里我手动调了cpu频率到4.9Ghz，如果刚开始频率比较低，冷启动还是会慢，用`vim-startuptime`
多次测试，前几次会比较慢，后面cpu会自动睿频所以速度会提升。

```bash
  vim-startuptime -vimpath nvim -warmup 3 -count 1000 | head -20
Extra options: []
Measured: 1000 times

Total Average: 17.316148 msec
Total Max:     19.761000 msec
Total Min:     15.956000 msec

  AVERAGE       MAX      MIN
-----------------------------
10.720994 12.434000 9.821000: /home/qiumix/.config/nvim/init.lua
 1.357487  1.855000 1.115000: nvim_exec2() called at /home/qiumix/.config/nvim/init.lua:0
 1.309999  1.809000 1.069000: /home/qiumix/.local/share/nvim/site/pack/core/opt/gruvbox.nvim/colors/gruvbox.lua
 1.183927  1.962000 1.014000: /home/qiumix/.config/nvim/filetype.lua
 1.143664  1.583000 1.000000: reading ShaDa
 0.867842  1.505000 0.727000: require('vim.filetype')
 0.687748  1.096000 0.530000: require('vim._core.defaults')
 0.605172  1.043000 0.430000: require('tree-sitter-manager')
 0.585311  0.805000 0.541000: loading rtp plugins
 0.554497  1.049000 0.346000: require('vim.pack')
 0.548095  1.144000 0.399000: require('core.options')
```

`grubvox`同步加载而非异步懒加载，会慢一点点，但是不会在启动的时候从默认neovim主题闪现到`gruvbox`。

## thanks

[dashboard](./dashboard.txt)是[lingshin](https://github.com/lingshinx)送我的生日礼物，感谢lingshin sama。(虽然现在没有装dashboard插件呢)
