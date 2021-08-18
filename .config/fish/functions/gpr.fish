function gpr
  function _cleanup -a status_code
    functions -e (functions -a | grep "^_gpr")
    functions -e _cleanup

    return $status_code
  end

  function _gpr_get_remote -a input_remote
    set -l remote $default_remote
    if test -n "$input_remote"
      echo $input_remote
    else
      echo $default_remote
    end
  end

  function _gpr_get_remote_url -a remote
    git remote get-url $remote
  end

  function _gpr_get_current_branch
    git symbolic-ref --short -q HEAD
  end

  function _gpr_branch_exists -a remote branch
    set -l remote_branch (git ls-remote -h $remote $branch)
    test -n "$remote_branch"
  end

  function _gpr_push_pending_changes -a remote_url remote branch
    if _gpr_branch_exists $remote_url $branch
      git push $remote $branch
      #git ls-remote aontehudaonethudaontehud
    else
      git push -u $remote $branch
    end
  end

  function _gpr_get_pr_url -a remote_url branch
    echo (echo $remote_url | awk '{sub(/^.*:/, "https://github.com/"); sub(/(\.git)?$/, "/compare/master...")}1')$branch
  end

  function _gpr_main
    set -lx default_remote origin

    git fetch;
    set -l remote (_gpr_get_remote $argv); or return
    set -l remote_url (_gpr_get_remote_url $remote); or return
    set -l branch (_gpr_get_current_branch); or return

    set -l push_output (_gpr_push_pending_changes $remote_url $remote $branch 2>&1); or set -l push_status $status; string split0 $push_output | /bin/cat; return $push_status

    set -l pr (_gpr_get_pr_url $remote_url $branch)
    echo $pr

    echo $remote
    echo $remote_url
    echo $branch
    echo $pr
  end

  _gpr_main
  _cleanup $status
end

#functions -e get_remote_url

#function gpr() {
  #git push origin HEAD

  #if [ $? -eq 0 ]; then
    #github_url=`git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#http://#' -e 's@com:@com/@' -e 's%\.git$%%'`;
    #branch_name=`git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3`;
    #pr_url=$github_url"/compare/master..."$branch_name
    #open $pr_url;
  #else
    #echo 'failed to push commits and open a pull request.';
  #fi
#}
