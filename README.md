# typst_template

typstの日本語テンプレート

## テンプレートの使い方

以下に `araki` というGitHubユーザーが `araki2024_note` という名前でこのリポジトリを複製する手順を示します．

※本GitHub Organizationで共有する際は `t2lab-it` で作業してください．

1. GitHubで `araki2024_note` という新しいリポジトリを作成する．
   このとき， `README` や `.gitignore` などを追加せず空のリポジトリを作成する．
2. 本テンプレートをその名前でcloneする

   ```bash
   gh repo clone t2lab-it/typst_template araki2024_note
   ```

3. 先ほど作成したリモートリポジトリを登録し， `push` する．

   ※空でないリポジトリを作成しているとここでエラーが出る．

   ```bash
   git remote set-url origin git@github.com:araki/araki2024_note
   git push origin HEAD
   ```

### テンプレートへの更新を取り入れるとき

1. このテンプレートのリポジトリを登録する

   ```bash
   git remote add upstream git@github.com:t2lab-it/typst_template
   ```

2. テンプレートの最新状態を取得する

   ```bash
   git fetch upstream
   ```

3. 自分が `master` / `main` ブランチにいることを確認し，テンプレートの最新状態を `merge` する

   ```bash
   git switch master && git merge upstream/master
   ```

4. 自身のリモートリポジトリを更新する

   ```bash
   git push origin HEAD
   ```

## 拡張機能について

- 上記の3つのファイルに加えて，`add_style.typ`ファイルもコピーすれば，いくつかの拡張機能が利用できます．
利用できる機能については，`test.pdf`を参考にしてください．
- 新たに拡張機能，或いは修正を作成した場合は，直接mainブランチに統合せずに，Pull requestsに出してください．
- 新たに欲しい拡張機能や修正などがあれば，Issuesに書いてください．
