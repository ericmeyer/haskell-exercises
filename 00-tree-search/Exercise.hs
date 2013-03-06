module Exercise00 where

import Test.Hspec
import Tree hiding (find, size)

testTree = insertList [40, 50, 30, 20, 35, 45, 60, 10, 25, 33, 37, 43, 47, 48, 70, 1, 11, 24, 26, 32, 34, 38, 39, 42, 44, 46, 48, 60] emptyTree

-- Here are the functions you have available from the Tree module:
--   emptyTree  :: Tree Int
--   insert     :: Int -> Tree Int -> Tree Int
--   insertList :: [Int] -> Tree Int -> Tree Int
--   isLeaf     :: Tree Int -> Bool
--   item       :: Tree Int -> Int
--   left       :: Tree Int -> Tree Int
--   right      :: Tree Int -> Tree Int

-- Here are the functions you need to write
find = undefined
size = undefined

-- Here are the tests
main = hspec $ do
  describe "Tree" $ do
    describe "find" $ do
      context "returns the subtree where the value is found" $ do
        it "finds 40 at the root" $ do
          find 40 testTree `shouldBe` testTree

        it "finds 10 with the children 1 and 11" $ do
          let subTree = insertList [10, 1, 11] emptyTree in
            find 10 testTree `shouldBe` subTree

      it "returns a leaf if the value is not found" $ do
        isLeaf (find 16781 testTree) `shouldBe` True

      it "returns the first occurence of a given element" $ do
          let subTree = insertList [60, 70, 60] emptyTree in
            find 60 testTree `shouldBe` subTree


    describe "size" $ do
      it "returns the number of nodes in a tree" $ do
        size testTree `shouldBe` 28

      it "doesn't count leaves as nodes" $ do
        size emptyTree `shouldBe` 0
