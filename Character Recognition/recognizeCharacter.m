function [X]=recognizeCharacter(character)
character=reshape(character,2500,1);
X=sim(net,character);
end