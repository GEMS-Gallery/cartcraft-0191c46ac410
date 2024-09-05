import React, { useState, useEffect } from 'react';
import { backend } from 'declarations/backend';
import { Box, Container, Grid, Typography, List, ListItem, ListItemIcon, ListItemText, Card, CardContent, CircularProgress } from '@mui/material';
import { Apple, LocalFlorist, LocalDrink, Cake } from '@mui/icons-material';

type Category = {
  id: string;
  name: string;
  icon: string;
};

type Item = {
  id: string;
  name: string;
  icon: string;
  description?: string;
  price?: number;
};

const iconMap: { [key: string]: React.ReactElement } = {
  apple: <Apple />,
  local_florist: <LocalFlorist />,
  local_drink: <LocalDrink />,
  cake: <Cake />,
};

const App: React.FC = () => {
  const [categories, setCategories] = useState<Category[]>([]);
  const [selectedCategory, setSelectedCategory] = useState<string | null>(null);
  const [items, setItems] = useState<Item[]>([]);
  const [loading, setLoading] = useState<boolean>(true);

  useEffect(() => {
    const fetchCategories = async () => {
      try {
        const result = await backend.getCategories();
        setCategories(result);
        if (result.length > 0) {
          setSelectedCategory(result[0].id);
        }
      } catch (error) {
        console.error('Error fetching categories:', error);
      } finally {
        setLoading(false);
      }
    };
    fetchCategories();
  }, []);

  useEffect(() => {
    const fetchItems = async () => {
      if (selectedCategory) {
        setLoading(true);
        try {
          const result = await backend.getItemsByCategory(selectedCategory);
          setItems(result || []);
        } catch (error) {
          console.error('Error fetching items:', error);
        } finally {
          setLoading(false);
        }
      }
    };
    fetchItems();
  }, [selectedCategory]);

  return (
    <Container maxWidth="lg">
      <Box sx={{ flexGrow: 1, mt: 4 }}>
        <Typography variant="h4" component="h1" gutterBottom>
          Modern Grocery App
        </Typography>
        <Grid container spacing={3}>
          <Grid item xs={12} md={3}>
            <List>
              {categories.map((category) => (
                <ListItem
                  button
                  key={category.id}
                  selected={category.id === selectedCategory}
                  onClick={() => setSelectedCategory(category.id)}
                >
                  <ListItemIcon>
                    {iconMap[category.icon] || <Apple />}
                  </ListItemIcon>
                  <ListItemText primary={category.name} />
                </ListItem>
              ))}
            </List>
          </Grid>
          <Grid item xs={12} md={9}>
            {loading ? (
              <Box display="flex" justifyContent="center" alignItems="center" height="200px">
                <CircularProgress />
              </Box>
            ) : (
              <Grid container spacing={2}>
                {items.map((item) => (
                  <Grid item xs={12} sm={6} md={4} key={item.id}>
                    <Card>
                      <CardContent>
                        <Box display="flex" alignItems="center" mb={2}>
                          {iconMap[item.icon] || <Apple />}
                          <Typography variant="h6" component="h2" ml={1}>
                            {item.name}
                          </Typography>
                        </Box>
                        {item.description && (
                          <Typography variant="body2" color="text.secondary" gutterBottom>
                            {item.description}
                          </Typography>
                        )}
                        {item.price && (
                          <Typography variant="body1" color="primary">
                            ${item.price.toFixed(2)}
                          </Typography>
                        )}
                      </CardContent>
                    </Card>
                  </Grid>
                ))}
              </Grid>
            )}
          </Grid>
        </Grid>
      </Box>
    </Container>
  );
};

export default App;