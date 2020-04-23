# Starts up WinAppDriver before the test
import subprocess
import os
import psutil

class StartDriver:
    def __init__(self, driver_path="C:/Program Files (x86)/Windows Application Driver/WinAppDriver"):
        self.f = open(os.devnull, 'w')
        self.process = None
        self.driver_path = driver_path

    def start_WAD(self, path=None):
        if path is None:
            path = self.driver_path
        self.process = subprocess.Popen([path], shell=False, stdin=None, stdout=self.f, stderr=None, close_fds=False)

    def stop_WAD(self):
        process = psutil.Process(self.process.pid)
        for pro in process.children(recursive=True):
            pro.kill()
        process.kill()

if __name__ == "__main__":
    driver=StartDriver()
    driver.start_WAD()
    driver.stop_WAD()