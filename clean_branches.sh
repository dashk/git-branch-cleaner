# Git branches cleanup utility
# @author dashk
# @date 2016.06.22

# Step 1: Make sure you're in a git repo
# Source: https://stackoverflow.com/questions/2180270/check-if-current-directory-is-a-git-repository
is_inside_git_directory="$(git rev-parse --is-inside-work-tree 2>/dev/null)"

if [ ! "$is_inside_git_directory" ]; then
        echo "You must run this within a Git directory"
        exit 1
fi

# Step 2: Get name of master branch
echo "What is the name of your master branch? (Press ENTER when done):"
read masterBranchName
echo "\r\n"

if [ ! -z "$masterBranchName" -a "$masterBranchName" != " " ]; then
        echo "Master branch name: $masterBranchName"
else
        echo "You must enter a master branch name."
        exit 1
fi

# Step 3: Navigate to master branch
git checkout $masterBranchName

# Step 4: Get a list of branches that are NOT master
branches=( $(git branch | grep -v $masterBranchName | grep -v '\*' | awk '{print $1}') )

# Step 5: Determine if there are any branches we need to process
branchCount=${#branches[@]}

echo "Total # of non-master branches: ${branchCount}"

if [ $branchCount = 0 ]
then
        echo "No branches to process"
else
        # Step 4: For each branch, prompt if it should be deleted/kept.
        for branch in "${branches[@]}"
        do
                :
                echo "Checking branch $branch"
                read -n1 -p "Do you want to delete this? (y/N) " userInput
                echo "\r\n"

                # Step 4.1 Delete branch per user request
                if [[ $userInput == "Y" || $userInput == "y" ]]; then
                        git branch -D $branch
                        echo "Branch $branch deleted\r\n"
                fi
        done
fi
