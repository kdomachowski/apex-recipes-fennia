public with sharing class AccountRepoConsumer {
    private AccountRepo accountRepo;

    public AccountRepoConsumer(AccountRepo accountRepo) {
        if (accountRepo != null) {
            this.accountRepo = accountRepo;
        } else {
            this.accountRepo = new AccountRepo();
        }
    }

    public String getAccountNameByAccountNumber(String accountNumber) {
        String query = 'SELECT Id, Name FROM Account WHERE AccountNumber = :accountNumber';
        Map<String, Object> bindVariablesMap = new Map<String, Object>{
            'accountNumber' => accountNumber
        };

        List<Account> myAccounts = this.accountRepo.queryAccountsWithBinds(
            query,
            bindVariablesMap,
            System.AccessLevel.USER_MODE
        );
        if (myAccounts != null && myAccounts.size() > 0) {
            return myAccounts.get(0).Name;
        }
        return null;
    }
}
