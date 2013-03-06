module Tree where

import Test.Hspec

-- You need to create this data type and the functions that operate on it
data Tree = ???

main = hspec $ do
  describe "Tree" $ do
    describe "isLeaf" $ do
      it "is True for leaves" $ do
        isLeaf Leaf `shouldBe` True

      it "is False for internal nodes" $ do
        isLeaf (Node 5 Leaf Leaf) `shouldBe` False

    describe "left" $ do
      it "returns the left element of internal nodes" $ do
        left (Node 5 (Node 3 Leaf Leaf) Leaf) `shouldBe` Node 3 Leaf Leaf

    describe "right" $ do
      it "returns the right element of internal nodes" $ do
        right (Node 10 Leaf (Node 67 Leaf Leaf)) `shouldBe` Node 67 Leaf Leaf

    describe "insert" $ do
      it "turns a leaf into a node" $ do
        let singleton = insert 5 Leaf in
          item singleton `shouldBe` 5

      it "inserts smaller items to the left of the given node" $ do
        let singleton = insert 5 Leaf
            node      = insert 3 singleton in
          item (left node) `shouldBe` 3

      it "inserts bigger items to the right of the given node" $ do
        let singleton = insert 5 Leaf
            node      = insert 10 singleton in
          item (right node) `shouldBe` 10

      it "inserts equal items to the right of the given node" $ do
        let singleton = insert 5 Leaf
            node      = insert 5 singleton in
          item (right node) `shouldBe` 5

      it "inserts new elements at a leaf node" $ do
        let singleton = insert 5 Leaf
            nodeOne   = insert 3 singleton
            nodeTwo   = insert 1 nodeOne in
          item (left (left nodeTwo)) `shouldBe` 1

    describe "insertList" $ do
      it "inserts the elements of a list into a tree from left to right" $ do
        let tree = insertList [5, 3, 1] Leaf in
          (tree == (Node 5 (Node 3 (Node 1 Leaf Leaf) Leaf) Leaf)) `shouldBe` True

