import Test.Hspec
import Tree

main = hspec $ do
  describe "Tree" $ do
    it "is only a leaf when empty" $ do
      isLeaf emptyTree `shouldBe` True

    describe "size" $ do
      it "is zero for leaves" $ do
        size emptyTree `shouldBe` 0

      it "is the number of nodes in the tree" $ do
        let one   = insert 6 emptyTree
            two   = insert 1 one
            three = insert 9 two
            four  = insert 3 three
        size one   `shouldBe` 1
        size two   `shouldBe` 2
        size three `shouldBe` 3
        size four  `shouldBe` 4

    describe "insert" $ do
      it "acts as a binary search tree" $ do
        let tree = insertList [4, 3, 6, 7, 5] emptyTree
        item tree                 `shouldBe` 4
        item (left tree)          `shouldBe` 3
        item (right tree)         `shouldBe` 6
        item (right (right tree)) `shouldBe` 7
        item (left (right tree))  `shouldBe` 5
