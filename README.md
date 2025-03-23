# typst_template

typstの日本語テンプレート

## テンプレートの使い方

1. 個人アカウント（`user`）でTypst文書を管理する新たなレポジトリ（ここでは`repository`という名前を例にする）を作成する
2. そのレポジトリを自分のPCにクローンする

   ```bash
   gh repo clone user/repository
   ```

3. このレポジトリをサブモジュールとして登録する

   ```bash
   cd repository
   git submodule add git@github.com:t2lab-it/typst_template.git
   ```

4. `main.typ`および`ref.typ`をコピーする

   ```bash
   cp typst_template/main.typ main.typ
   cp typst_template/ref.typ ref.typ
   ```

### テンプレートへの更新を取り入れるとき

1. サブモジュール内をpullする

   ```bash
   cd typst_template
   git pull origin HEAD
   ```

## 拡張機能について

- 新たに拡張機能，或いは修正を作成した場合は，直接mainブランチに統合せずに，Pull requestsに出してください．
- 新たに欲しい拡張機能や修正などがあれば，Issuesに書いてください．
