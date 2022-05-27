package transaction

import (
	"errors"
	"startup/campaign"
	"startup/payment"
)

type service struct {
	repository     Repository
	campaign       campaign.Repository
	paymentService payment.Service
}

type Service interface {
	GetTransactionByCampaignID(input GetCampaignTransactionsInput) ([]Transaction, error)
	GetTransactionsByUserID(UserID int) ([]Transaction, error)
	CreateTransaction(input CreatedTransactionInput) (Transaction, error)
}

func NewService(repository Repository, campaign campaign.Repository, paymentService payment.Service) *service {
	return &service{repository, campaign, paymentService}
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

func (s *service) CreateTransaction(input CreatedTransactionInput) (Transaction, error) {
	transaction := Transaction{}
	transaction.CampaignID = input.CampaignID
	transaction.Amount = input.Amount
	transaction.UserID = input.User.ID
	transaction.Status = "pending"

	newTransaction, err := s.repository.Save(transaction)
	if err != nil {
		return newTransaction, err
	}

	paymentTransaction := payment.Transaction{
		ID:     newTransaction.ID,
		Amount: newTransaction.Amount,
	}

	paymentURL, err := s.paymentService.GetPaymentURL(paymentTransaction, input.User)
	if err != nil {
		return newTransaction, err
	}

	transaction.PaymentURL = paymentURL

	newTransaction, err = s.repository.Update(transaction)
	if err != nil {
		return newTransaction, err
	}

	return newTransaction, nil
}
