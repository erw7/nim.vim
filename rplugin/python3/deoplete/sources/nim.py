from .base import Base

import deoplete.util

class Source(Base):
    def __init__(self, vim):
        Base.__init__(self, vim)

        self.name = 'nim'
        self.mark = '[nim]'
        self.filetypes = ['nim']
        self.is_bytepos = True
        self.rank = 500
        self.input_pattern = r'\.\w*'
        self.is_debug_enabled= True

    def get_complete_position(self, context):
        return self.vim.call('NimComplete',
                             1, '')

    def gather_candidates(self, context):
        return self.vim.call('NimComplete',
                             0, context['complete_str'])
