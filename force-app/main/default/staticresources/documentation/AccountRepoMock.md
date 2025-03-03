# AccountRepoMock Class

`ISTEST`

**Implements**

[AccountRepoInterface](AccountRepoInterface.md)

## Fields
### `instance`

#### Signature
```apex
private static instance
```

#### Type
[AccountRepoMock](AccountRepoMock.md)

---

### `accountMap`

#### Signature
```apex
private accountMap
```

#### Type
Map&lt;Id,Account&gt;

## Methods
### `getInstance()`

Implements the signleton pattern

#### Signature
```apex
public static AccountRepoMock getInstance()
```

#### Return Type
**[AccountRepoMock](AccountRepoMock.md)**

---

### `queryAccountsWithBinds(queryString, bindVariablesMap, accessLevel)`

Returns the all records returned from the query.

#### Signature
```apex
public List<Account> queryAccountsWithBinds(String queryString, Map<String,Object> bindVariablesMap, System.AccessLevel accessLevel)
```

#### Parameters
| Name | Type | Description |
|------|------|-------------|
| queryString | String |  |
| bindVariablesMap | Map&lt;String,Object&gt; |  |
| accessLevel | System.AccessLevel |  |

#### Return Type
**List&lt;Account&gt;**

---

### `insertDBObject(account)`

#### Signature
```apex
public void insertDBObject(Account account)
```

#### Parameters
| Name | Type | Description |
|------|------|-------------|
| account | Account |  |

#### Return Type
**void**

---

### `insertDBObjects(accounts)`

#### Signature
```apex
public void insertDBObjects(List<Account> accounts)
```

#### Parameters
| Name | Type | Description |
|------|------|-------------|
| accounts | List&lt;Account&gt; |  |

#### Return Type
**void**

---

### `updateDBObject(account)`

#### Signature
```apex
public void updateDBObject(Account account)
```

#### Parameters
| Name | Type | Description |
|------|------|-------------|
| account | Account |  |

#### Return Type
**void**

---

### `updateDBObjects(accounts)`

#### Signature
```apex
public void updateDBObjects(List<Account> accounts)
```

#### Parameters
| Name | Type | Description |
|------|------|-------------|
| accounts | List&lt;Account&gt; |  |

#### Return Type
**void**

---

### `deleteDBObject(account)`

#### Signature
```apex
public void deleteDBObject(Account account)
```

#### Parameters
| Name | Type | Description |
|------|------|-------------|
| account | Account |  |

#### Return Type
**void**

---

### `deleteDBObjects(accounts)`

#### Signature
```apex
public void deleteDBObjects(List<Account> accounts)
```

#### Parameters
| Name | Type | Description |
|------|------|-------------|
| accounts | List&lt;Account&gt; |  |

#### Return Type
**void**

## Classes
### AccountRepoException Class