if spacevim#funcs#LayerLoaded('tmux')
  MP 'ctrlpvim/ctrlp.vim'
  MP 'FelikZ/ctrlp-py-matcher'
else
  MP 'kien/ctrlp.vim',      { 'on': ['CtrlP', 'CtrlPMRU'] }
  MP 'FelikZ/ctrlp-py-matcher', { 'on': ['CtrlP', 'CtrlPMRU'] }
endif
