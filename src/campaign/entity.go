package campaign

import "startup/user"

type Campaign struct {
	ID               int
	UserID           int
	Name             string
	ShortDescription string
	Description      string
	Perks            string
	BackerCount      int
	GoalAmount       int
	CurrentAmount    int
	Slug             string
	CreatedAt        int
	UpdatedAt        int
	CampaignImages   []CampaignImage
	User             user.User
}

type CampaignImage struct {
	ID         int
	CampaignID int
	Filename   string
	IsPrimary  int
	CreatedAt  int
	UpdatedAt  int
}
