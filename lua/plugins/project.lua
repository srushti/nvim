return {
	{
		"letieu/jira.nvim",
		cmd = { "Jira" },
		opts = {
			-- Your setup options...
			jira = {
				base = os.getenv("JIRA_BASE_URL"), -- Base URL of your Jira instance
				email = os.getenv("JIRA_EMAIL"), -- Your Jira email (Optional for PAT)
				token = os.getenv("JIRA_TOKEN"), -- Your Jira API token or PAT
				type = "basic", -- Authentication type: "basic" (default) or "pat"
				limit = 200, -- Global limit of tasks per view (default: 200)
			},
		},
	},
}
