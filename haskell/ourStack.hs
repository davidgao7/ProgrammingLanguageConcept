


-- valid list = empty list
-- valid list = element, valid list

push :: a -> [a] -> [a]
push el [] = [el]
push el stck = (el:stck)

top :: [a] -> a
top (el:els) = el

pop :: [a] -> (a,[a])
pop (el:els) = (el,els)

size :: [a] -> Integer
size [] = 0
size (el:els) = (size els) + 1

clear :: [a] -> [a]
clear _ = []







