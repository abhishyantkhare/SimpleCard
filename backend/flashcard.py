class FlashCard:

    def __init__(self, content=""):
        self._content = content
    
    def getContent(self):
        return self._content

    def setContent(self, content):
        self._content = content