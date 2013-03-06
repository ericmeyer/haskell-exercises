module Tree where

data Tree a = Leaf
            | Node { item  :: a,
                     left  :: Tree a,
                     right :: Tree a } deriving (Eq, Show)

find :: (Ord a) => a -> Tree a -> Tree a
find searchItem node | isLeaf node             = node
                     | searchItem == item node = node
                     | searchItem >  item node = find searchItem (right node)
                     | otherwise               = find searchItem (left node)

size :: Tree a -> Int
size Leaf                = 0
size (Node _ left right) = 1 + size left + size right

emptyTree :: Tree a
emptyTree = Leaf

isLeaf :: Tree a -> Bool
isLeaf Leaf = True
isLeaf _    = False

insert :: (Ord a) => a -> Tree a -> Tree a
insert item    Leaf = Node item Leaf Leaf
insert newItem node | newItem >= item node = node { right = insert newItem (right node)  }
                    | otherwise            = node { left  = insert newItem (left node) }

insertList :: (Ord a) => [a] -> Tree a -> Tree a
insertList []     tree = tree
insertList (x:xs) tree = insertList xs (insert x tree)
