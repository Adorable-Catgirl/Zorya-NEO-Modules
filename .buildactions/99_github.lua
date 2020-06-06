function actions.github()
	os.execute("git add .")
	os.execute("git commit -m \"Repo regenerated.\"")
	os.execute("git push")
end

actions[#actions+1] = "github"