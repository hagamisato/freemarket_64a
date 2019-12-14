crumb :root do
  link "メルカリ", root_path
end



# マイページ関連ーーーーーーーーーーーーーーーーーーーーーーーーーー

crumb :mypage do
  link "マイページ"
  # ルートパスつけるーーーー
end

crumb :profile do
  link "プロフィール"
  # ルートパスつけるーーーー
end

crumb :rogout do
  link "ログアウト"
   # パスつけるーーーー
end



# 新規登録関連ーーーー使わないーーーーーーーーーー
crumb :choice do
  link "選択"
  # , top_signup_index_path
end

crumb :reg do
  link "会員情報入力"
  # , reg_signup_index_path
  parent :choice
end

crumb :tell do
  link "電話番号の確認"
  parent :reg
end

crumb :pay do
  link "支払い方法"
  parent :tell
end

crumb :finish do
  link "登録完了"
  parent :pay
end




# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).