module ApplicationHelper

    def user_upvote_color(user, votable) 
        user&.voted_up_on?(votable) ?  'ThumbsUp_icon_blue.png' : 'ThumbsUp_icon.png'
    end 


    def user_downvote_color(user, votable) 
        user&.voted_down_on?(votable) ? 'ThumbsDown_icon_blue.png' : 'ThumbsDown_icon.png' 
    end 

    def follow_problem(user, problem)
        problems = user&.follows
        problems&.select { |v| v.problem == problem}&.first
    end
end
