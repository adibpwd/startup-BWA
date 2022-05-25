package transaction

import (
	"errors"
	"startup/campaign"
)

type service struct {
	repository Repository
	campaign   campaign.Repository
}

type Service interface {
	GetTransactionByCampaignID(input GetCampaignTransactionsInput) ([]Transaction, error)
	GetTransactionsByUserID(UserID int) ([]Transaction, error)
}

func NewService(repository Repository, campaign campaign.Repository) *service {
	return &service{repository, campaign}
}

func (s *service) GetTransactionByCampaignID(input GetCampaignTransactionsInput) ([]Transaction, error) {

	campaign, err := s.campaign.FindByID(input.ID)
	if err != nil {
		return []Transaction{}, err
	}

	if campaign.UserID != input.User.ID {
		return []Transaction{}, errors.New("Not an owner of the campaign")
	}

	transactions, err := s.repository.GetByCampaignID(input.ID)
	if err != nil {
		return transactions, err
	}

	return transactions, nil
}

func (s *service) GetTransactionsByUserID(UserID int) ([]Transaction, error) {
	transactions, err := s.repository.GetByUserID(UserID)
	if err != nil {
		return transactions, err
	}

	return transactions, nil
}
