import { render, screen } from '@testing-library/react';
import { describe, it, expect } from 'vitest';
import App from './App';

describe('App Component', () => {
  it('renders task manager heading', () => {
    render(<App />);
    const heading = screen.getByText('Task Manager');
    expect(heading).toBeInTheDocument();
  });

  it('renders add task button', () => {
    render(<App />);
    const addButton = screen.getByText('Add Task');
    expect(addButton).toBeInTheDocument();
  });

  it('renders search input', () => {
    render(<App />);
    const searchInput = screen.getByPlaceholderText('Search by name');
    expect(searchInput).toBeInTheDocument();
  });
});
