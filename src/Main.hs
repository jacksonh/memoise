import Snap

data Memoise
  = Memoise { }

indexHandler :: Handler Memoise Memoise ()
indexHandler = writeText "Hello, world!"

memoiseInit :: SnapletInit Memoise Memoise
memoiseInit = makeSnaplet "memoise" "The world's laziest hyperlink shortener" Nothing $ do
  addRoutes [("", indexHandler)]
  return $ Memoise { }

main :: IO ()
main = do
  (_, site, _) <- runSnaplet Nothing memoiseInit
  quickHttpServe site
