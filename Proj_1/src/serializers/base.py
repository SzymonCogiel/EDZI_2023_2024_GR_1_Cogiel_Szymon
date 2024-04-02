import json


class BaseSerializer:

    def list_to_json(self, list_of_instances, file_path: str = 'submission.json'):
        json_data = json.dumps([instance.dict() for instance in list_of_instances], cls=getattr(self, 'Meta'), indent=4)
        with open(file_path, 'w') as file:
            file.write(json_data)
        print(f'JSON data has been written to {file_path}')
