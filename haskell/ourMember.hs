


ourMember :: Eq e => e -> [e] -> Bool
-- ourMember 'a' "nebraska" = True
-- ourMember 'c' "nebraska" = False
ourMember _ [] = False
ourMember el (h:t) = (el == h) || (ourMember el t)

