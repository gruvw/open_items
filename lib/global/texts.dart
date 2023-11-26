abstract class Texts {
  static const authenticateTitle = "Add Account";

  static const selectButton = "Select";
  static const createButton = "Create";
  static const addButton = "Add";
  static const editButton = "Edit";
  static const deleteButton = "Delete";
  static const loginButton = "Log In";

  static const createAccountTab = "Create Account";
  static const loginTab = loginButton;
  static const onlineAccountTab = "Online Account";
  static const offlineAccountTab = "Offline Account";

  static const emailFieldLabel = "Email address";
  static const usernameFieldLabel = "Username";
  static const accountFieldLabel = "Account name";
  static const passwordFieldLabel = "Password";

  static const emptyLists = "Create new lists using the + button";
  static const emptyItems = "Create new items using the + button";
}

abstract class MenuTexts {
  static const orderBy = "Order By";
  static const stackDone = "Stack Done Items";
  static const collectionType = "Collection Type";
  static const defaultListType = "Default List Type";
  static const editTitle = "Edit Title";
  static const editText = "Edit Text";
  static const deleteList = "Delete List";
  static const deleteItem = "Delete Item";

  static const drawerAccounts = "Accounts";
  static const drawerAddAccount = "Add account";
  static const drawerImport = "Import data";
  static const drawerExport = "Export data";
  static const drawerRenameAccount = "Rename account";
  static const drawerDeleteAccount = "Delete account";
}

abstract class DialogTexts {
  static const createAccountTitle = "Account creation";
  static const createAccountConfirm = "Let's go!";
  static const createAccountMessage =
      "Welcome to Open-Items!\nYou can create an online account to benefit from the associated functionalities such as syncing and sharing, or use an offline account and access the application right away.";

  static const newListTitle = "New List Title";
  static const newItemText = "New Item Text";

  static const collectionTypeTitle = "Change Collection Type";

  static const editTextTitle = "Edit Item Text";
  static const editTitleTitle = "Edit List Title";

  static const deleteCollectionTitle = "Delete Collection";
  static const deleteCollectionContent =
      "Do you really want to delete the following collection ?";

  static const deleteAccountTitle = "Delete Account";
  static const deleteAccountContent =
      "Do you really want to delete the following account ?";

  static const editAccountTitle = "Edit Account Name";
}

abstract class ValidationTexts {
  static const accountMissing = "Account name is mandatory.";
  static const accountLength =
      "Account names must have between 2 and 20 characters.";
  static const accountContent =
      "Account names must only contain alphanumeric characters or underscores.";
  static const accountExists = "Account name already exists.";

  static const titleMissing = "List title is mandatory.";
  static const textMissing = "Item text is mandatory.";
}
