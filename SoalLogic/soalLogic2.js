const express = require("express");
const axios = require("axios");

const app = express();

app.get("/search", async (req, res) => {
  try {
    const { queryparam } = req.query;
    const apiUrl = `https://en.wikipedia.org/w/api.php?action=query&list=search&srsearch=${queryparam}&format=json`;

    const response = await axios.get(apiUrl);
    const searchData = response.data.query.search;

    let maxContentSize = 0;
    let maxContentData = {};

    searchData.forEach((item) => {
      if (item.size > maxContentSize) {
        maxContentSize = item.size;
        maxContentData = item;
      }
    });

    const result = {
      Title: maxContentData.title,
      Page_ID: maxContentData.pageid,
      Size: maxContentData.size,
      Word_Count: maxContentData.wordcount,
      Content: maxContentData.snippet,
    };

    res.json(result);
  } catch (error) {
    res.status(500).json({ error: "Internal server error" });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server berjalan pada port ${PORT}`);
});
