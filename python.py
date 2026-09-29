Python 3.11.4 (tags/v3.11.4:d2340ef, Jun  7 2023, 05:45:37) [MSC v.1934 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license()" for more information.
KeyboardInterrupt

Innovation Day Showcase System Competition

projects = [
    {
        "project_id": "p1001",
        "category": "rpg",
        "team_members": ["Team A"],
        "scores": [90.0, 92.0, 88.0]
    },
    {
        "project_id": "p1002",
        "category": "puzzle",
        "team_members": ["Team B"],
        "scores": [67.0, 65.0, 69.0]
    },
    {
        "project_id": "p1003",
        "category": "puzzle",
        "team_members": ["Team C"],
        "scores": [89.0, 91.0, 87.0]
    },
    {
        "project_id": "p1004",
        "category": "fps",
        "team_members": ["Team D"],
        "scores": [78.0, 80.0, 76.0]
    },
    {
        "project_id": "p1005",
        "category": "rpg",
        "team_members": ["Team E"],
        "scores": [56.0, 54.0, 58.0]
    },
    {
        "project_id": "p1006",
        "category": "moba",
        "team_members": ["Team F"],
        "scores": [34.0, 30.0, 38.0]
    }
]

Functional Programming: Calculate Average Score

def average_score(scores):
    if not scores:
        return 0.0

    return sum(scores) / len(scores)

Functional Programming: Create New Project List
using map()

def calculate_project_averages(project_list):
    return list(map(
        lambda project: {
            **project,
            "average": average_score(project["scores"])
        },
        project_list
    ))


Functional Programming: Filter Projects
with average score >= 80

def filter_top_projects(project_list):
    return list(filter(
        lambda project: project["average"] >= 80.0,
        project_list
    ))

Object-Oriented Programming
Project class for project information

class ProjectManager:

    def __init__(self, projects):
        self.projects = projects

    # Find the project with the highest score
    def find_winner(self):
        if not self.projects:
            return None

        winner = self.projects[0]

        for project in self.projects[1:]:
            if project["average"] > winner["average"]:
                winner = project

        return winner

    # Display project details
    def display_project(self, project):
        print("Project ID   :", project["project_id"])
        print("Category     :", project["category"])
        print("Team Members :", ", ".join(project["team_members"]))
        print("Scores       :", project["scores"])
        print("Average Score: {:.2f}".format(project["average"]))
        print()


Main Program


print("==============================================")
print(" INNOVATION DAY SHOWCASE SYSTEM COMPETITION")
print("==============================================")

# Calculate average score for every project
project_averages = calculate_project_averages(projects)

Display all projects

... print("\nALL PROJECTS AND AVERAGE SCORES")
... print("----------------------------------------------")
... 
... manager = ProjectManager(project_averages)
... 
... for project in project_averages:
...     manager.display_project(project)
... 
... 
... 
... Filter projects with average score >= 80
... 
... top_projects = filter_top_projects(project_averages)
... 
... print("TOP PROJECTS (AVERAGE SCORE >= 80)")
... print("----------------------------------------------")
... 
... for project in top_projects:
...     manager.display_project(project)
... 
... Find winning project
... 
... winner = manager.find_winner()
... 
... print("PROJECT WINNER")
... print("----------------------------------------------")
... 
... if winner:
...     manager.display_project(winner)
... else:
