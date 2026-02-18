// Weather API Integration

const fetchWeatherData = async (city) => {
    const apiKey = 'YOUR_API_KEY'; // Replace with your API key
    const response = await fetch(`https://api.weatherapi.com/v1/current.json?key=${apiKey}&q=${city}`);
    if (!response.ok) {
        throw new Error('Failed to fetch weather data');
    }
    return response.json();
};

export default fetchWeatherData;