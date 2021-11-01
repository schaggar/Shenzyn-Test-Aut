import ImapLibrary

class CustomImapLibrary(ImapLibrary.ImapLibrary):
    def get_email_body(self, email_index):

        if self._is_walking_multipart(email_index):
            body = self.get_multipart_payload(decode=True)
        else:
            body = self._imap.uid('fetch', email_index, '(BODY[TEXT])')[1][0][1]
        return body
