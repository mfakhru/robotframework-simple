import json

class CustomLib:
    def read_configuration(self):
        with open('configuration.json') as json_file:
            config = json.load(json_file)
        return config

if __name__ == "__main__":
   cust = CustomLib()
   print(cust.read_configuration())
