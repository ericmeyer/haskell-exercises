Setup
=====

In order to run the exercises in this repository, you'll need the Haskell platform and the hspec library.

On OSX you can get the Haskell platform from Homebrew:

    brew install haskell-platform

After that you can get hspec from cabal:

    cabal update
    cabal install hspec

Once you've installed both of those, you can clone the repository and run the test script:

    git clone git@github.com:MichaelBaker/haskell-exercises.git
    cd haskell-exercises
    runhaskell Test.hs

The output should look like this:

    success
      - succeeds

    failure
      - fails FAILED [1]

    1) failure fails FAILED
    expected: False
     but got: True

    Finished in 0.0004 seconds
    2 examples, 1 failure
