I wrap a mail message specifically from a HyperKitty archive, e.g., https://lists.squeakfoundation.org/archives/. HyperKitty's mbox files adhere pretty much to the standards, but they currently have a number of quirks which are worked around here.

Other known issues:
- Inline images do not work due to missing CIDs (https://gitlab.com/mailman/hyperkitty/-/issues/474#issue-2)
- @ characters in links and mail addresses are obfuscated (https://gitlab.com/mailman/hyperkitty/-/issues/474#issue-4)