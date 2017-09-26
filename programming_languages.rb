
def reformat_languages(languages)
    new_hash = {} #our new reformatted hash
    jscript_array = [] #containter for the two styles attached to javascript
    languages.each do |lang_style, lang_data|   #iterate through the first level, getting lang_style (oo/functional) and the lang_names
        lang_data.each do |lang_name, lang_type| #iterate through the second level, getting land_names and the lang_type hash with type descriptions
            style_array = [] #container for the style of the other languages, since javascript has two style values
            if lang_name == :javascript #IF we find javascript values for style, we capture that value, and pass it to...
                jscript_array << lang_style #the jscript_array, where we store both style values, which is the only unique detail that seprates jscript
                lang_type.each do |type, val| #then we iterate into the third level, to capture the type, as well as the value of of the type.
                    #now that we have iterated through every level, we have access to every key and value, allowing us to start formatting
                    new_hash[lang_name] = { type => val, :style => jscript_array.flatten } #assign the name, with its type and add the :style using our jscript_array
                        end
            else  #when not looking at javascript languages, add normal formatting for the other languages
            lang_type.each do |k, v| #by iterating down to the third level to grab the type key and value
                style_array << lang_style #store the style into the array we created in the first part of the method
                new_hash[lang_name] = { k => v, :style => style_array } #and assign the key to the lang_name and store the type, its value as one key-value pair and the style array as the second key-value pair
                    end
                end
            end
        end
    new_hash
end
                        
=begin
 original format
 
 languages = {
    :oo => {
        :ruby => {
             :type => "interpreted"
        },
        :javascript => {
            :type => "interpreted"
        },
        :python => {
            :type => "interpreted"
        },
        :java => {
            :type => "compiled"
        }
    },
    :functional => {
        :clojure => {
            :type => "compiled"
        },
        :erlang => {
            :type => "compiled"
        },
        :scala => {
            :type => "compiled"
        },
        :javascript => {
            :type => "interpreted"
        }
        
    }
}
=end
