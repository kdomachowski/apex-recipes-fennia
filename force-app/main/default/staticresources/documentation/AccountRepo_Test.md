# AccountRepo_Test Class

`ISTEST`

## Methods
### `testSetup()`

`TESTSETUP`

#### Signature
```apex
private static void testSetup()
```

#### Return Type
**void**

---

### `testQueryWithBindsPositive()`

`ISTEST`

#### Signature
```apex
private static void testQueryWithBindsPositive()
```

#### Return Type
**void**

---

### `testQueryWithBindsNegative()`

`ISTEST`

#### Signature
```apex
private static void testQueryWithBindsNegative()
```

#### Return Type
**void**

---

### `testCreateSinglePositive()`

`ISTEST`

#### Signature
```apex
private static void testCreateSinglePositive()
```

#### Return Type
**void**

---

### `testCreateBatchPositive()`

`ISTEST`

#### Signature
```apex
private static void testCreateBatchPositive()
```

#### Return Type
**void**

---

### `testUpdateSinglePositive()`

`ISTEST`

#### Signature
```apex
private static void testUpdateSinglePositive()
```

#### Return Type
**void**

---

### `testUpdateBatchPositive()`

`ISTEST`

#### Signature
```apex
private static void testUpdateBatchPositive()
```

#### Return Type
**void**

---

### `createAccounts(accountNamePrefix, accountNumberPrefix, totalNumber)`

Helper method to create accounts

#### Signature
```apex
private static List<Account> createAccounts(String accountNamePrefix, String accountNumberPrefix, Integer totalNumber)
```

#### Parameters
| Name | Type | Description |
|------|------|-------------|
| accountNamePrefix | String |  |
| accountNumberPrefix | String |  |
| totalNumber | Integer |  |

#### Return Type
**List&lt;Account&gt;**