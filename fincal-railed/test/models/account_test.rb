require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test 'calculate_fv_returns_1254.40' do
    account = create_savings_account_to_calculate_fv
    assert_equal(1254.40, account.calculate_fv)
  end

  test 'calculate_fv_when_int_compounded_daily' do
    account = create_fv_account_compounding_daily
    assert_equal(5126.50, account.calculate_fv)
  end

  test 'calculate_pv_when_int_compounded_monthly' do
    account = create_pv_account_compounding_monthly
    assert_equal(54963.27, account.calculate_pv)
  end

  test 'calculate_pv_returns_19304.59' do
    account = create_deferred_payment_to_calculate_present_value
    assert_equal(19304.59, account.calculate_pv)
  end

  test 'calculate_fv_annuity_returns_21000' do
    account = create_fv_annuity_account
    assert_equal(21100.0, account.calculate_fv_annuity)
  end

  test 'calculate_pv_annuity_returns_17125.23' do
    account = create_pv_annuity_account
    assert_equal(17125.23, account.calculate_pv_annuity)
  end

  test 'calculate_simple_interest_rate_returns_18.62' do
    account = create_simple_interest_account
    assert_equal(18.62, account.calculate_simple_interest_rate)
  end

  test 'size_of_annuity_payment_returns_308.11' do
    account = create_sinking_fund_annuity_account
    assert_equal(308.11, account.calculate_size_of_annuity_payment)
  end

  test 'interest_must_be_mathematically_valid' do
    interest_account = create_pv_account_compounding_monthly
    assert_equal([], interest_account.errors.full_messages)
  end

  def create_pv_account_compounding_monthly
    new_account = Account.new(name: 'IOU',
                              user_id: 1,
                              category: 'deferred',
                              balance: 100000,
                              interest: 6,
                              compounding_frequency: 12,
                              compounding_periods: 120)
    return new_account
  end

  def create_fv_account_compounding_daily
    new_account = Account.new(name: 'IOU',
                              category: 'deferred',
                              balance: 5000,
                              interest: 4,
                              compounding_frequency: 365,
                              compounding_periods: 228)
    return new_account
  end

  def create_sinking_fund_annuity_account
    new_account = Account.new(name: 'IOU',
                              category: 'deferred',
                              balance: 7000,
                              interest: 9,
                              compounding_frequency: 2,
                              compounding_periods: 16)
    return new_account
  end
  def create_simple_interest_account
    new_account = Account.new(name: 'IOU',
                              category: 'deferred',
                              balance: 1960,
                              interest: 40,
                              compounding_frequency: nil,
                              compounding_periods: 40)
    return new_account
  end

  def create_pv_annuity_account
    new_account = Account.new(name: 'IOU',
                              category: 'deferred',
                              balance: 10000,
                              interest: 11,
                              compounding_frequency: 1,
                              compounding_periods: 2)
    return new_account
  end

  def create_fv_annuity_account
    new_account = Account.new(name: 'IOU',
                              category: 'deferred',
                              balance: 10000,
                              interest: 11,
                              compounding_frequency: 1,
                              compounding_periods: 2)
    return new_account
  end

  def create_deferred_payment_to_calculate_present_value
    new_account = Account.new(name: 'IOU',
                              category: 'deferred',
                              balance: 25000,
                              interest: 9,
                              compounding_frequency: 1,
                              compounding_periods: 3)
    return new_account
  end
  def create_savings_account_to_calculate_fv
    new_account = Account.new(name: 'CIBC savings',
                              category: 'savings',
                              balance: 1000,
                              interest: 12,
                              compounding_frequency: 1,
                              compounding_periods: 2)
    return  new_account
  end
end
