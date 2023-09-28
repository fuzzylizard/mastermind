import { fireEvent, render, screen } from '@testing-library/react';
import App from './App';

it ('renders Mastermind', () => {
  render(<App />);
  const element = screen.getByText(/mastermind/i);
  expect(element).toBeInTheDocument();
});

it ('should place a guess button on the screen', () => {
  render(<App />);
  const element = screen.getByRole('button', { name: /guess/i });
  expect(element).toBeInTheDocument();
});

it ('should return false when button is pressed', () => {
  render(<App />);
  const button = screen.getByRole('button', { name: /guess/i });
  fireEvent.click(button);
  const response = screen.getByText(/wrong guess/i);
  expect(response).toBeInTheDocument();
});

it('should display four boxes for selecting colour for a guess', () => {
  render(<App />);

});
