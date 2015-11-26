function SwitchNumbersToNormalMode()
endfunction

function SwitchNumbersToInsertMode()
endfunction

describe 'using absolute line numbers'
  before
    set number
  end

  after
    set nonumber
  end

  describe 'in insert mode'
    before
      call SwitchNumbersToInsertMode()
    end

    it 'uses absolute line numbers'
      Expect &number == 1
      Expect &relativenumber == 0
    end
  end

  describe 'in normal mode'
    before
      call SwitchNumbersToNormalMode()
    end

    it 'uses absolute line numbers'
      Expect &number == 1
      Expect &relativenumber == 0
    end
  end
end

describe 'using relative line numbers'
  before
    set relativenumber
  end

  after
    set norelativenumber
  end

  describe 'in insert mode'
    before
      call SwitchNumbersToInsertMode()
    end

    it 'uses absolute line numbers'
      Expect &number == 1
      Expect &relativenumber == 0
    end
  end

  describe 'in normal mode'
    before
      call SwitchNumbersToNormalMode()
    end

    it 'uses relative line numbers'
      Expect &number == 0
      Expect &relativenumber == 1
    end
  end
end

describe 'using hybrid line numbers'
  before
    set number
    set relativenumber
  end

  after
    set nonumber
    set norelativenumber
  end

  describe 'in insert mode'
    before
      call SwitchNumbersToInsertMode()
    end

    it 'uses absolute line numbers'
      Expect &number == 1
      Expect &relativenumber == 0
    end
  end

  describe 'in normal mode'
    before
      call SwitchNumbersToNormalMode()
    end

    it 'uses hybrid line numbers'
      Expect &number == 1
      Expect &relativenumber == 1
    end
  end
end
