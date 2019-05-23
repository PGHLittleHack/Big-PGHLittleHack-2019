from requests import get, post
import tweepy

def analyze_tweet(text):
  body = {
      "text": text
  }

  r = post('http://localhost:8080/textbox/check', json=body)
  return r.json()['sentences'][0]['sentiment']

consumer_key = 'Xx348xBl4qckLvjIkoiQNyR58'
consumer_secret = 'Uct53ynFitDdkKllYGOPGa8xYJa25p1DQwuy2gT7YBiUmaBYsw'
access_token = '35301409-W1XCVjbkmyRVa8I1RYNWVEctviwtlIVyCuLiJ8ebF'
access_token_seret = 'mNIFOd6xQGGR869707GAoHNYqnEce35IxKyR0dXEfe2PM'
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_seret)

api = tweepy.API(auth)

tweets = api.user_timeline(screen_name='johna_white', count=200)

things = []

for tweet in tweets:
  things.append(tweet.text)

total = len(things)
score = 0

for thing in things:
  ana = analyze_tweet(thing)
  score += ana
  # print(ana)

print((score/total) * 100)