import Test.Hspec

main = hspec $ do
  describe "success" $ do
    it "succeeds" $ do
      True `shouldBe` True

  describe "failure" $ do
    it "fails" $ do
      True `shouldBe` False
