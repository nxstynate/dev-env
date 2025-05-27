function update-gitrepo
    git status
    git add .

    # Format the date as YYYY-MM-DD
    set current_date (date "+%Y-%m-%d")

    git commit -m "Updated files on $current_date"
    git status
    git push
end
