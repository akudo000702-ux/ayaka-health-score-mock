import json, urllib.request

def get_json(url: str):
    with urllib.request.urlopen(url) as res:
        return json.loads(res.read().decode())

if __name__ == "__main__":
    # ネット接続が無い環境では動きません（デモ）
    url = "https://jsonplaceholder.typicode.com/todos/1"
    data = get_json(url)
    print(data)
