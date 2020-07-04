class FlashCard:

    def __init__(self, front="", back=""):
        self._front = front
        self._back = back

    def getFront(self):
        return self._front

    def setFront(self, front):
        self._front = front

    def getBack(self):
        return self._back

    def setBack(self, back):
        self._back = back

    def to_dict(self):
        return {'front': self._front, 'back': self._back}
