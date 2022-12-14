    ["LORUM"] = {
        --Settings Demo By KevinWho
        settings = {
            multiline = true,
            max_words_per_line = 10,
        },
        
        func = function (doc, arguments, Utils, Settings, Defaults)
            --Credit to https://github.com/seleznevae/lua-lorem
            --Defalt to 5 sentances
                        
            local sentances = 5
            if(arguments[1]) then
                arguments[1] = tonumber(arguments[1])
            end
            
            local lorem = {}
                        
            local WORDS_IN_SENTENCE      = {min = 5, max = 15}
            local SENTENCES_IN_PARAGRAPH = {min = 2, max = 7 }
            --local PARAGRAPHS_IN_TEXT     = {min = 2, max = 7 }
            
            local function random_int(min, max)
                return math.random(min, max)
            end

            local BASE_PHRASE = [[
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Suspendisse rutrum accumsan elit vel auctor.
    Praesent sit amet aliquam turpis.
    Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.
    Maecenas non erat ut elit sodales commodo.
    Nam gravida ipsum quis nulla tempus, quis pulvinar augue tristique.
    Nulla massa odio, imperdiet non ultricies tincidunt, viverra sed lorem.
    Nulla elementum sapien ut commodo aliquet.
    Pellentesque iaculis turpis tellus, eget laoreet augue condimentum vel.
    Quisque at risus rhoncus, facilisis tellus nec, tristique dolor.
    Maecenas cursus magna eget imperdiet laoreet.
    ]]

            local function get_words(phrase)
                local list = {}
                for word in phrase:gmatch('%a+') do
                    table.insert(list, word:lower())
                end
                return list
            end

            lorem.__index = lorem
            lorem._dict = get_words(BASE_PHRASE)

            function lorem:generator(phrase)
                if type(phrase) ~= 'string' then
                    error('First argument of lorem.generator should be a string', 2)
                end
                local g = {_dict = {}}
                for word in phrase:gmatch('%a+') do
                    table.insert(g._dict, word:lower())
                end
                if #(g._dict) == 0 then
                    error('String argument of lorem.generator should contain words', 2)
                end
                setmetatable(g, self)
                return g
            end

            function lorem:word()
                return self._dict[random_int(1, #(self._dict))]
            end

            function lorem:sentence()
                local n = random_int(WORDS_IN_SENTENCE.min, WORDS_IN_SENTENCE.max)
                local words = {}
                for i = 1, n do
                    words[i] = self:word()
                end
                local s = table.concat(words, ' ')
                s = s .. "."
                s = s:sub(1, 1):upper() .. s:sub(2)
                return s
            end

            function lorem:paragraph(sentences)
                local n = sentences
                local sentences = {}
                for i = 1, n do
                    sentences[i] = self:sentence()
                end
                return table.concat(sentences, ' ')
            end

            local text = lorem:paragraph(sentances);
            
            if(Settings.multiline) then
                local splitText = string.split(text, " ")
                local spaceCounter = 0
                
                text = ""
                for i = 1, #splitText do
                    
                    local endText = ""
                    
                    if i ~= #splitText then
                        endText = " "
                        if spaceCounter > Settings.max_words_per_line then
                            endText = endText .. "\n				"
                            spaceCounter = 0
                        end
                    end
                    
                    text = text .. splitText[i] .. endText
                    
                    spaceCounter += 1
                end

                return "local lorum = [["..text.."]]"

            end
                
            return "local lorum = \""..text.."\""
            
        end
    }
