package campaign

import "startup/user"

type GetCampaignDetailInput struct {
	ID int `uri:"id" binding:"required"`
}

type CreateCampaignInput struct {
	Name             string
	ShortDescription string
	Description      string
	GoalAmount       int
	Perks            string
	User             user.User
}
